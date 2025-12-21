import 'package:flutter/material.dart';

class LazyIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;

  const LazyIndexedStack({
    super.key,
    required this.index,
    required this.children,
  });

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  // 用于记录哪些页面已经被加载过了
  late List<bool> _loaded;

  @override
  void initState() {
    super.initState();
    // 初始化时，只有当前 index 的页面标记为已加载
    _loaded = List.generate(widget.children.length, (i) => i == widget.index);
  }

  @override
  void didUpdateWidget(LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 只要 index 发生变化，就把对应的页面标记为已加载
    if (!_loaded[widget.index]) {
      setState(() {
        _loaded[widget.index] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: widget.index,
      children: List.generate(widget.children.length, (i) {
        // 如果页面加载过，渲染真实组件；否则返回一个空容器
        return _loaded[i] ? widget.children[i] : const SizedBox.shrink();
      }),
    );
  }
}
