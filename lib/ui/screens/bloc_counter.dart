import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/ui/blocs/counter_bloc/counter_bloc_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void increasedCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) => Text(
            'BLoC counter: ${counterBloc.state.transactionCount}',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterReset()),
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter value: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => increasedCounterBy(context, 3),
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => increasedCounterBy(context, 2),
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => increasedCounterBy(context),
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
