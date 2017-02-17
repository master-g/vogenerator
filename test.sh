#!/usr/bin/env bash
#protoc --plugin=protoc-gen-vo=vo-generator.py --vo_out=./build hello.proto
protoc -I=sample --plugin=protoc-gen-vo=protoc-gen-vo --vo_out=./sample/build sample/hello.proto
