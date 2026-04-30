# Flink Basics for PR Review

When reviewing Flink PRs, keep these core concepts in mind and explain them simply if they are relevant to the change:

## 1. DataStream API vs Table API/SQL
- **DataStream API**: Low-level, imperative. Users define transformations (map, flatMap, window, etc.) on streams.
- **Table API/SQL**: High-level, declarative. Flink optimizes the execution plan.

## 2. State and Checkpointing
- Flink is stateful. State is stored in "State Backends" (HashMap or RocksDB).
- Checkpointing is the mechanism for fault tolerance. It takes snapshots of the state.
- **Keyed State**: State tied to a specific key in the stream.
- **Operator State**: State tied to a specific operator instance.

## 3. Time and Windows
- **Event Time**: When the event actually happened (based on timestamps in data).
- **Processing Time**: When the event is processed by the machine.
- **Watermarks**: Signals that tell Flink how much event-time progress has been made.

## 4. Architecture (JobManager & TaskManager)
- **JobManager**: The master. Orchestrates execution, checkpoints, and recovery.
- **TaskManager**: The workers. Execute the actual tasks (subtasks of operators).
- **Slots**: Fixed amount of resources in a TaskManager.

## 5. Serialization (TypeInformation & PojoSerializer)
- Flink needs to serialize data to move it between workers or store it in state.
- POJOs must have a default constructor and getters/setters (or be public) for efficient serialization.

## 6. Connectivity (Connectors)
- Source: Where data comes from (Kafka, FileSystem, etc.).
- Sink: Where data goes.

## 7. Configuration
- Many changes involve `ConfigOption`. They should have descriptions and default values.
