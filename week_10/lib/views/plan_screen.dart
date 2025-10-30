import 'package:flutter/material.dart';
import 'package:week_10/models/plan.dart';
import 'package:week_10/models/task.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan _plan = Plan();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Master plan - Farrel AD')),
      body: ListView.builder(
        controller: _scrollController,
        keyboardDismissBehavior:
            Theme.of(context).platform == TargetPlatform.iOS
            ? ScrollViewKeyboardDismissBehavior.onDrag
            : ScrollViewKeyboardDismissBehavior.manual,
        itemCount: _plan.tasks.length,
        itemBuilder: (context, index) =>
            _buildTaskTile(_plan.tasks[index], index),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _plan = Plan(
              name: _plan.name,
              tasks: List<Task>.from(_plan.tasks)..add(Task()),
            );
          });
        },
      ),
    );
  }

  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            _plan = Plan(
              name: _plan.name,
              tasks: List<Task>.from(_plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            _plan = Plan(
              name: _plan.name,
              tasks: List<Task>.from(_plan.tasks)
                ..[index] = Task(description: text, complete: task.complete),
            );
          });
        },
      ),
    );
  }
}
