class DetailsEvent {}
class LoadDetailsEvent extends DetailsEvent {
  final String id;
  LoadDetailsEvent({required this.id});
}