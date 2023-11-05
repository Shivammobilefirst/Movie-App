enum Status { initial, inProgress, loaded, failed }

extension StatusX on Status {
  bool get isInitial => this == Status.initial;
  bool get isInProgress => this == Status.inProgress;
  bool get isLoaded => this == Status.loaded;
  bool get isFailed => this == Status.failed;
}
