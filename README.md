# vogenerator
Protobuf plugin for compile proto file into Java Value Objects

## Example

```protobuf
// Hello.proto
enum Greeting {
    NONE = 0;
    MR = 1;
    MRS = 2;
    MISS = 3;
}

message Hello {
    required Greeting greeting = 1;
    required string name = 2;
    optional bytes sig = 3;
}
```

will generate 2 files

```java
// Greeting.java
public enum Greeting {

    NONE(0),
    MR(1),
    MRS(2),
    MISS(3),
    UNKNOWN(-1);

    public int code;

    Greeting(int code) { this.code = code; }

    public static Greeting valueOf(final int code) {
        for (Greeting c : Greeting.values()) {
            if (code == c.code) return c;
        }
        return UNKNOWN;
    }
}
```

and

```java
// Hello.java
public class Hello {
    public Greeting greeting;
    public String name;
    public byte[] sig;

    @Override
    public String toString() {
        return "Hello{" +
               "greeting=" + greeting +
               ", name='" + name + '\'' +
               ", sig=" + Arrays.toString(sig) +
               '}';
    }
}
```

## Usage

```bash
$ mkdir sample/build
$ protoc --plugin=protoc-gen-vo=protoc-gen-vo --vo_out=./sample/build sample/hello.proto
```

```bash
$ mkdir proto/build
$ protoc -I=./proto --plugin=protoc-gen-vo=protoc-gen-vo --vo_out=./proto/build proto/group.proto
```