
# What is List and Map ?
## List  (fixed-length & growable) :

- ```List is collection of multiple values which can have multiple datatype.``` 
- List is an ordered collection of values, which contains index values to access it's inner attributes.
- List have indexes like arrays.
- List can be created using '[]'.

### How to declration List :

- ```Syntax : ``` List variableName = [Values];

### Example
```
void main() {
  
    List name = ["Ankit", "A", "B", "C"];

    print(name[0]);
}
```

#### To know length of List :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name.length);
}
```

#### To add up :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    name.add(50);
  
    print(name);
}
```

#### To add Multiple values :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    name.addAll(['Akhil', 40, 90]);
  
    print(name);
}
```

#### To Insert to value :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];

    print(name[0]);

    name.insert(2, 50);

    print(name);
}
```

#### To Insert Multiple values :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    name.insertAll(2, [1, 2, 3, 4]);
  
    print(name);
}
```

#### To know the index of the list Value :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    int i = name.indexOf("Jaynesh");
  
    print(i);
}
```

#### To Remove a Value :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    name.remove("B");
  
    print(name);
}
```

#### To Remove a value for Index :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    name.removeAt(3);
  
    print(name);
}

```

#### To Reverse a List :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    print(name.reversed.toList());
}
```

#### To Show Datatype :
```
  void main() {
    List name = ["Ankit", "A", "B", "C"];
  
    print(name[0]);
  
    print(name.runtimeType);
}
```

## Generics   

- Generics will be used to fix the datatype in the list.
- fix any one data type in the collection data types.
- it can be applied to either data types, value or both.
- ``` Example : ``` List <int> number = [10,20,30,40,50];

### Example

```
import 'dart:io';

  void main() {
    List <String> name = [];

    print("Enter number of Name : ");
    int n = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < n; i++) {
      print("Enter Name : ");
      String val = stdin.readLineSync()!;
      name.add(val);
    }

    print(name);
  }
```
## Map

- ```Map is collection of values. Map is store data in key value pair. which can have different datatype.``` 
- Map can be created using '{}'.

### syntax :
```
Map mapName = {
  key1 : value1, 
  key2 : value2, 
  ... 
  keyN : valueN, 
  };
```
### Example :
``` 
void main() {
    Map emp = {
      'name': "Jaynesh",
      'age': 20,
      'per': 89.23,
      'salary': 89000,
    };
    
    emp.forEach((key, value) {
      print("${key} : ${value}");
    });
  }
```

### List of Map :
``` 
void main() {
 
  List myData = [
    {
      'name': "Parth",
      'age': 20,
      'per': 89.23,
      'salary': 89000,
    },
    {
      'name': "Ankit",
      'age': 25,
      'per': 90.23,
      'salary': 90000,
    },
    {
      'name': "Hiren",
      'age': 21,
      'per': 98.23,
      'salary': 50000,
    }
  ];

  myData.forEach((e) {
    e.forEach((key, val) {
      print("${key} : ${val}");
    });
    print("");
  });
}
```
