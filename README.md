# vogenerator
Protobuf plugin for compile proto file to Java Value Objects

## Usage

```bash
$ mkdir sample/build
$ protoc --plugin=protoc-gen-vo=protoc-gen-vo --vo_out=./sample/build sample/hello.proto
```

```bash
$ mkdir proto/build
$ protoc -I=./proto --plugin=protoc-gen-vo=protoc-gen-vo --vo_out=./proto/build proto/group.proto
```