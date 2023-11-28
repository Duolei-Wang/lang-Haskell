# Ch2 Type System and Function

# 2.1 Type and Data

- Bool, Char, Int, Word, Integer
- Float, Double, Rational
  Rational is an arbitrary precision float number, which use the symbol '%' as the division.
- Tuple, List
  Haskell use '[]' represent a Tuple, also means a pair, and '()' a List. A List is a component of countable
- String
  Inner String of Haskell is defined as the List of Char.

## 2.1.2 Function

### 1. Non-Curried Function

Function with finite parameters, included by parenthesis.

### 2. Curried Function

### 3. Polymorphic Function

#### Anytype

In Haskell, the declare type of function can use 'a', 'b' and 'c', the simple characters, to represent a type.

#### Type restrict

We can use the Typeclass to restrict some type.

```Haskell
abs :: Num a => a -> a
```

The 'a' is declared as the type or one of the subtype of Num. The type of 'a' in right part is reduced into the Num.

## 2.1.3 Alias of Type

We can use the keyword 'type' to define an alias of some existing type.

```Haskell
type RGB = (Int, Int, Int)
```

The alias of type is like the keyword struct in C/CPP.



# 2.2 Typeclass

In Ch9, we will describe the Typeclass in detail.

Every Typeclass can be defined with the keyword 'class'. And one can define the method should be implemented. The 'instance' can be also created.

## 2.2.1 Eq

## 2.2.2 Ord

## 2.2.3 Enum

## 2.2.4 Bounded

## 2.2.5 Num

### Promote and Reduce

The number itself must be one instance class of Num. When we calculate the operators defined on Num, we actually must promote the number to a upper-class and reduce it into the result we need.

The functions begin with 'from' will promote the number with precise type to Num, and 'toXXX' will reduce a Num number to the given type 'XXX'.



### Fixed

We can fixed the precision of a float number.

```Haskell
> 3.33333 :: Fixed E3
3.333
```



### NAN, Infinity and epsilon





## 2.3 Function

### 2.3.1 Value

### 2.3.3 Define a Function

The first line should define the Type of this Function. Then the following part contains the detail definition of a function.

```Haskell
f :: Num a => a -> a
f x = 2 * x + 1
```



## 2.4 $\lambda$ Calculus

Haskell deleted the '->' between parameters, we can defined a function with the help of $\lambda$-expresssion.

```Haskell
f = \ x y -> 4*x + 5*y
```



- $\alpha$-Conversion

  The name of parameter is not very important. We can use 'x', 'y' and 'z', but also 'a', 'b' and 'c'.


$$
\lambda x.\lambda y.(x+y) \overset{\alpha}{=} \lambda a.\lambda b.(a + b)
$$




- $\beta$-Reduction

  $\beta$-Reduction means the replacement of parameter to the given position, the replacement action itself. And the right part include an expression '[N/x]M', which means replace the 'x's in M with 'N'.


$$
(\lambda x \to M) N \overset{\beta}{\implies} [N/x]M
$$




- $\eta$-Reduction

  $\eta$-Reduction means the reduction of parameters' name.

$$
(\lambda x.Mx)  \overset{\eta}{\implies} M
$$



### 2.4.1 Anonymous Function



### 2.4.2 Parameter Binding

We use 'let' and 'in' to bind some parameters with special value or expression. The keyword 'where' also work for this.

```Haskell
s :: Double -> Double -> Double -> Double
s a b c = let p = (a + b + c) / 2 in sqrt (p * (p - a) * (p - b) * (p - c))  	
```

Which is same as the following.

```haskell
s' :: Double -> Double -> Double -> Double
s' a b c = sqrt (p * (p - a) * (p - b) * (p - c))
  where
  	p = (a + b + c) / 2
```



## 2.5 Expression

### 2.5.1 Condition expression

We use 'if', 'then' and 'else' as a component expression.

```Haskell
isTwo :: Int -> Bool
isTwo n = if n == 2 then True else False
```

One should notice that anyone of the three keywords can't be delete.

### 2.5.2 Case expression

One can use the guard in Haskell. The keyword 'case' and 'of' are used for this.



### 2.5.3 Guarded expression

Guarded expression is used as the simplification of the Case-expression.

```haskell
abs :: (Ord a, Num a) => a -> a
abs x
    | x >= 0 = x
    | otherwise = -x
```





# Ch5 Recursive Function





# Ch6 List Comprehension

## 6.1 Generator



## 



# Ch8 Data and Type

Data is a combination of existing types.

数据、类型的构造依赖已有的 type，而 type 本身要么是基本类型的别名，要么是 newtype。

其中，newtype 封装已有的 type 为新的 type，data 组合已有的 type 为一个数据，data 组合的数据无法用作 type 进行新的组合。

- data

  通过

  ```Haskell
  data DATA_NAME <参数列表> = 构造 Data 的语法
  ```

  其中，这个定义方式会受到 $\eta$-Reduction 的简化。

- type

  为类型创建一个别名，方便书写罢了。

- newtype

  把类型封装成一个可以被编译器识别的新类型。

  



## 8.1 Define a Data

A Data can be defined by listing. And one can derive some Typeclass, the GHCi will build the deriving properties automatically. Actually, we use the sentence like the following to define a data by enumerating.

```Haskell
data DATA_NAME = Enum1 | Enum 2 | ... | Enum N
```

Or combination,

```Haskell
data DATA_NAME = DATA_NAME Val_1 Val_2 ... Val_N
```

The combination case like the keyword 'type'.

Also, a Data should contain generator. If we use the normal decalre like the following.

```Haskell
data Book = Book Name Author ISBN Price deriving (Show, Eq)
```

When we want to use the properties of Book, we need define the property-get functions like the followings.

```Haskell
name (Book n _ _ _) = n 
author (Book _ a _ _) = a 
isbn (Book _ _ i _) = i 
price (Book___p)=p
```

Thus, Haskell implements a easy way to declare a Data.

```Haskell
data Book = Book
  { name :: Name
  , author :: Author
  , isbn :: ISBN
  , price :: Price
  }
```

Then, the function 'name' will get the property 'Name' of a given book.

The 'Data' defined a combination data, and this data can be represent by a tuple like the tuple in property-get function.

### 8.1.3 Parameterized Type

Some type need other type to define. For example, the Show need to be implemented on different Num type. Thus, Haskell use the keyword 'instance Show <NEW_TYPE>' to define the instance of a Parmaeterized Type.

Another example is the 'List'. One can thinking the type of '[1, 2, 3]' and '[1.0, 2.0, 3.0]' are toally different 'List[Int]' and 'List[Float]'.









# Ch9 Class

































