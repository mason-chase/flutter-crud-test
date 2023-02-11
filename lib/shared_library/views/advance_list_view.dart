import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class AdvanceListView<T> extends StatefulWidget {
  final List<T> items;
  final String emptyPageTitle;
  final Axis scrollDirection;
  final Future<void> Function()? onLoadMoreData;
  final Future<void> Function()? onRefreshData;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final bool hasMoreData;
  final bool shrinkWrap;
  final ScrollController? scrollController;

  const AdvanceListView({
    required this.itemBuilder,
    this.onRefreshData,
    this.emptyPageTitle = '',
    this.items = const [],
    this.onLoadMoreData,
    this.hasMoreData = false,
    this.shrinkWrap = false,
    this.scrollDirection = Axis.vertical,
    this.scrollController,
    final Key? key,
  }) : super(key: key);

  @override
  AdvanceListViewState<T> createState() => AdvanceListViewState<T>();
}

class AdvanceListViewState<T> extends State<AdvanceListView<T>> {
  int animationDuration = 400;
  final GlobalKey<AnimatedListState> listKey = GlobalKey();
  ScrollController? _scrollController;

  ScrollController get _effectiveScrollController =>
      widget.scrollController ?? (_scrollController ??= ScrollController());

  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));
  bool _isLoading = false;
  bool _canRefresh = true;
  int _lastItemRemovedTimeLine = -1;

  bool get _hasMoreData => widget.hasMoreData;

  bool get _isEmpty => !widget.hasMoreData && widget.items.isEmpty;

  bool get _isLoadingData => _isLoading;

  bool get _reachedLoadMoreOffset =>
      _effectiveScrollController.position.extentAfter < 88;

  late VoidCallback _scrollListener;

  @override
  Widget build(final BuildContext context) => RefreshIndicator(
      onRefresh: _onRefresh,
      child: Stack(
        children: [
          _listviewWidget,
          if (_isEmpty) _empty(),
        ],
      ));

  Widget _empty() => Center(
        child: Text(
          'Nothing to show!',
          style: Get.textTheme.caption,
        ),
      );

  Widget get _listviewWidget {
    Widget result = AnimatedList(
      key: listKey,
      controller: _effectiveScrollController,
      scrollDirection: widget.scrollDirection,
      physics: const AlwaysScrollableScrollPhysics(),
      //  padding: _padding,
      //  reverse: widget.reverse,
      //  primary: widget.primary,
      initialItemCount: widget.items.length,
      shrinkWrap: widget.shrinkWrap,
      itemBuilder: _lisItemBuilder,
    );
    result = CupertinoScrollbar(
      controller: _effectiveScrollController,
      thickness: 6.0,
      radius: const Radius.circular(20),
      isAlwaysShown: true,
      child: result,
    );

    return Stack(
      children: [
        result,
        if (_hasMoreData && widget.items.isEmpty) _loadingOrErrorWidget,
      ],
    );
  }

  Widget _lisItemBuilder(
    final BuildContext context,
    final int index,
    final Animation<double> animation,
  ) =>
      _axisWidget(
        children: [
          _itemContainer(
            context,
            index,
            animation,
          ),
          if (_hasMoreData && index == widget.items.length - 1)
            _loadingOrErrorWidget,
        ],
      );

  Widget get _loadingOrErrorWidget => _loadingWidget;

  Widget get _loadingWidget => const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: CircularProgressIndicator(),
        ),
      );

  Widget _axisWidget({required final List<Widget> children}) =>
      widget.scrollDirection == Axis.vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );

  Widget _itemContainer(
    final BuildContext context,
    final int index,
    final Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: widget.itemBuilder(
            context,
            widget.items[index],
            index,
          ),
        ),
      );

  Future<void> _onRefresh() async {
    if (!_canRefresh) {
      return;
    }
    _canRefresh = false;
    await widget.onRefreshData?.call();
    _canRefresh = true;
  }

  Future<void> _callLoadMoreData() async {
    _isLoading = true;
    return widget.onLoadMoreData?.call().whenComplete(() {
      _isLoading = false;
    });
  }

  @override
  void didUpdateWidget(covariant final AdvanceListView<T> oldWidget) {
    if (oldWidget.scrollController != widget.scrollController) {
      if (oldWidget.scrollController != null &&
          widget.scrollController == null) {
        oldWidget.scrollController?.removeListener(_scrollListener);
      }
      _effectiveScrollController.addListener(_scrollListener);
    }
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      if (widget.items.isNotEmpty) {
        _checkLoadMoreData();
      }
      _maybeTriggerScrollbar();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      _maybeTriggerScrollbar();
    });
    super.didChangeDependencies();
  }

  void _maybeTriggerScrollbar() {
    if (_effectiveScrollController.hasClients) {
      _effectiveScrollController.position.notifyListeners();
    }
  }

  @override
  void initState() {
    _scrollListener = () async {
      if (_hasMoreData &&
          !_isLoadingData &&
          widget.items.isNotEmpty &&
          _reachedLoadMoreOffset) {
        await _callLoadMoreData();
      }
    };
    _effectiveScrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _debouncer.cancel();
    _effectiveScrollController.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  void setState(final VoidCallback fn) {
    _checkLoadMoreData();
    _maybeTriggerScrollbar();
    super.setState(fn);
  }

  void _checkLoadMoreData() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (_hasMoreData &&
          !_isLoadingData &&
          widget.items.isNotEmpty &&
          _effectiveScrollController.position.maxScrollExtent == 0) {
        await _callLoadMoreData();
      }
    });
  }

  void addAll(final List<T> items, {final bool withAnimation = true}) {
    for (final T item in items) {
      addItem(item, withAnimation: withAnimation);
    }
  }

  void addItem(
    final T item, {
    final int? atIndex,
    final bool withAnimation = true,
  }) {
    listKey.currentState!.insertItem(
      atIndex ?? 0,
      duration: withAnimation
          ? Duration(milliseconds: animationDuration)
          : Duration.zero,
    );

    widget.items.insert(atIndex ?? widget.items.length, item);
    setState(() {});
  }

  void clearAllItems() {
    for (var i = 0; i <= widget.items.length - 1; i++) {
      listKey.currentState!
          .removeItem(0, (final context, final animation) => const SizedBox());
    }
    widget.items.clear();
  }

  T? removeItem(final T item) => removeItemAt(widget.items.indexOf(item));

  T? removeItemAt(final int index) {
    if (DateTime.now().millisecondsSinceEpoch - _lastItemRemovedTimeLine <
        604) {
      return null;
    }
    if (_isOutOfRange(index)) {
      return null;
    }
    _lastItemRemovedTimeLine = DateTime.now().millisecondsSinceEpoch;
    final T removedItem = widget.items.removeAt(index);
    if (removedItem != null) {
      listKey.currentState!.removeItem(
        index,
        (final context, final animation) => _axisWidget(
          children: [
            FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0.0,
                child: widget.itemBuilder(
                  context,
                  removedItem,
                  index,
                ),
              ),
            ),
          ],
        ),
        duration: Duration(milliseconds: animationDuration),
      );
      Future.delayed(
        Duration(milliseconds: animationDuration),
        () => setState(() {}),
      );
    }
    return removedItem;
  }

  void operator []=(final int index, final T item) {
    if (_isOutOfRange(index)) {
      return;
    }
    setState(() {
      widget.items[index] = item;
    });
  }

  bool _isOutOfRange(final int index) =>
      index < 0 || index > widget.items.length - 1;

  T operator [](final int index) => widget.items[index];

  List<T> get items => widget.items;
}
