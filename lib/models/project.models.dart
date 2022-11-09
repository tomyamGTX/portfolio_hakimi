class Project {
  String? name;
  int? colorIndex;
  String? link;

  Project({required this.name, required this.colorIndex, required this.link});

  @override
  String toString() {
    return 'Project Name:$name, Index color:$colorIndex, project link:$link';
  }
}
