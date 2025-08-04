# SMILe Team Proposed R Style Guide

## Purpose 

The purpose of this style guide is to encourage a more standardized appearance of code written in the R scripting language. The ultimate goal of this style guide is to assist in writing code that is both **readable** and **maintainable**. Emphasis is to be placed on the phrase _more standardized_, as no style guide can adequately capture the correct styling of every bit of code. The recommendations in this style guide should be followed when practicable, but developers are encouraged to think about how to best present code that satisfies the conditions of readability and maintainability. 

Each recommendation in the style guide will consist of the parts

* Recommendation
* Rationale
* Good examples
* Bad examples

The rationale for the recommendation acknowledges that style guides are inherently opinionated, sometimes strongly so. Providing the rationale assists the developer in understanding the intended goal of the recommendation and identifying when it may be beneficial to deviate from the recommendation. 

## Naming Objects and Functions

### Most Objects

_Recommendation:_ Objects should be named as nouns using lowercase letters with words separated by an underscore (`_`; this may be referred to as "snake case"). Object names should be concise, but should also reflect clearly the information represented by the object. Specific recommendations and exceptions are given below for objects with particular classes.

_Rationale:_ This naming style is broadly accepted in the larger R Community. While R permits separating words in object names with a dot (`.`), this is also used in S3 method dispatch. Underscores are preferred to avoid confusing objects with methods. 

```
# Good examples -----------------------------------------------------
study_name
date_completed

# Bad examples ------------------------------------------------------
study.name
dateCompleted
firstdayofthemonth
```

### Data Frames

_Recommendation:_ Objects that inherit the `data.frame` class are named with the first letter of each word being capitalized (including the first word; this may be referred to as "camel case").

_Rationale:_ Data is essential to the work and analyses being conducted and are the central focus of most scripts. Naming data objects in this manner helps them stand out from other objects and functions, making them readily identifiable.

```
# Good examples -----------------------------------------------------
PatientVisit
Demographic
ClinicalValues

# Bad examples ------------------------------------------------------
# These do not separate data objects from other common objects
patient_visit
clinical_values
```

### Logical vectors

_Recommendation:_ Logical vectors should usually be named with a prefix that poses the name in the form of a question, such as `is_` or `has_`.

_Rationale:_ These vectors are often used in logical operations or comparisons. The `is_` and `has_` prefixes emphasis the binary nature of these objects. 

```
# Good examples -----------------------------------------------------
is_randomized
has_family_history
is_compliant

# Acceptable --------------------------------------------------------
randomized
compliant

# Bad examples ------------------------------------------------------
# these names are not unambiguously binary
lab_completion
electronic_record
```

### Constants

_Recommendation:_ Constants should be identified using all capital letters with words separated by an underscore. Constants should be declared and initialized at the start of a script.

_Rationale:_ R does not have a native, immutable form for constants. This appearance makes it easy for developers to identify values that should be treated as constant and avoid reassigning them inappropriately.

```
# Good examples -----------------------------------------------------
CONFIDENCE_LEVEL <- 0.95
POWER <- 0.80
Z <- qnorm(1.96)

# Bad examples ------------------------------------------------------
alpha <- 0.05    # common name that might inadvertently be reassigned
z <- qnorm(1.96) # common name that might inadvertently be reassigned
```

### Functions

_Recommendation:_ Functions should be named as either a verb or an action statement that describes what the function does. The function name should be written in a form of camel case where the first letter of the first word is lower case, but the first letter of each subsequent word is upper case. 

_Rationale:_ Functions are another class of object that are important to recognize quickly. This form of camel case makes them readily distinguishable from both common objects and data frames. 

<font color = "purple">Note, this recommendation is not found in any of the common style guides and could be somewhat controversial. The recommendation in most popular style guides is that functions should be named in snake case. I'm open to adopting this standard, but I do find it useful to be able to distinguish functions from other objects. 

However, there is no universally agreed upon standard in the R community and developers are likely to encounter function names of many different styles in distributed R packages. It would be impossible to adopt any standard that will not find a conflict with some other community developed package. However we choose to name functions may as well reflect the preferences of our team</font>

```
# Good examples -----------------------------------------------------
calculateConfidenceLimit
getComplianceData
countDaysBetweenVisits

# Bad examples ------------------------------------------------------
CalculateToxicity   # Follow naming recommendations for data frames
days_between_visits # Not a verb, and uses object naming conventions
```

### Files

_Recommendation:_ File names should be meaningful and end in `.R`. When possible, the filenames should reflect the primary function or purpose of the file. If multiple words are to be used, separate them with a dash ("-"). 

_Rationale:_ Spaces and underscores in file names can, on some legacy systems, create problems in retrieving files. Consistent use of the `.R` extension (with capital R) makes R files readily identifiable on screen and easier to search via command.

```
# Good examples -----------------------------------------------------
calculateConfidenceLimit.R  # file with the function of the same name
exploratory-data-analysis.R # file with code for EDA

# Bad examples ------------------------------------------------------
test.R
final analysis v3.r
```

## Function Definitions and Calls

### Documenting Functions

_Recommendation:_ When defining new functions, document the purpose of the function and the function arguments with a minimum of argument name, data type, and purpose. As an exception, single use utility functions defined in the script may not need additional documentation. (If familiar, you may consider using roxygen tags when documenting functions. This may assist with converting code into stand-alone packages)

_Rationale_: This minimum information can provide context to future developers regarding what is expected behavior within a function definition. 

```
# Good examples ----------------------------------------------------

# convertStringToDate
# converts a string in dd-bbb-yy format to a Date object. 
# has an override to allow conversion for other formats
# 
# x - character - string to be converted to a date
# format - character - the format of the date in the string

convertStringToDate <- function(x, 
                                format = "%d-%b-%y"){
  as.Date(x, 
          format = format)
}

# Using roxygen tags
#' @name convertStringtoDate
#' @title Convert a Character Value to a Date Object
#' 
#' @description Converts a string in dd-bb-yy format to a Date object. 
#' Includes an override argument to allow conversion from other formats.
#' 
#' @param x `character(n)`. String to be converted to a date.
#' @param format `character(1)`. The format of the date in the string.

convertStringToDate <- function(x, 
                                format = "%d-%b-%y"){
  as.Date(x, 
          format = format)
}

# Bad example -------------------------------------------------------
# No documentation of purpose or arguments
convertStringToDate <- function(x, 
                                format = "%d-%b-%y"){
  as.Date(x, 
          format = format)
}

```

### Defining Functions


_Recommendation:_ Define functions with one argument per line. 

_Rationale:_ this separation helps future developers see all of the arguments and understand any default argument values.

```
# Good examples -----------------------------------------------------
calculateConfidenceLimits <- function(data, 
                                      numerator, 
                                      denominator, 
                                      use_overdispersion = TRUE, 
                                      is_two_sided = TRUE, 
                                      confidence_moderate = 0.80, 
                                      confidence_severe = 0.95){
  # Functional code here..... 
}

# It can also be helpful to utilize line breaks to keep code within the
# 80 character limit

calculateConfidenceLimits <- 
  function(data, 
           numerator, 
           denominator, 
           use_overdispersion = TRUE, 
           is_two_sided = TRUE, 
           confidence_moderate = 0.80, 
           confidence_severe = 0.95){
    # Functional code here..... 
  }

# Bad example -------------------------------------------------------
calculateConfidenceLimits <- 
  function(data, numerator, denominator, 
           use_overdispersion = TRUE, 
           is_two_sided = TRUE, confidence_moderate = 0.80, 
           confidence_severe = 0.95){
    # Functional code here..... 
  }
```

### Calling Functions

_Recommendation:_ When calling functions, include only one argument per line. Avoid reliance on positional matching and name the arguments. 

Exceptions: some arguments can be exceptionally obvious. For instance `mean(x)` obviously implies take the mean of `x`. Developers are free to exercise judgement in not listing obvious arguments.

_Rationale:_ Especially in local and rapid development, the order of arguments can change and positional matching may result in unexpected behaviors that are difficult to debug. Naming arguments in function calls prevents the reliance on positional matching and results in informative errors should argument names change.

```
# Good example ------------------------------------------------------
calculateConfidenceLimits(data = RelevantDataSet, 
                          numerator = "numerator_variable", 
                          denominator = "denominator_variable", 
                          use_overdispersion = FALSE, 
                          is_two_sided = TRUE)

# To preserve horizontal space
calculateConfidenceLimits(
  data = RelevantDataSet, 
  numerator = "numerator_variable", 
  denominator = "denominator_variable", 
  use_overdispersion = FALSE, 
  is_two_sided = TRUE
)

# Bad example -------------------------------------------------------
calculateConfidenceLimits(
  data = RelevantDataSet, numerator = "numerator_variable", 
  denominator = "denominator_variable", use_overdispersion = FALSE, 
  is_two_sided = TRUE)

# over reliance on positional matching
calculateConfidenceLimits(
  RelevantDataSet, "numerator_variable", "denominator_variable", 
  FALSE, TRUE
)
```

## Structure

### `library` calls

_Recommendation:_ All calls to the `library` function should appear at the beginning of the primary analysis script. `library` should not be used in files that will be run via `source`. When possible, list packages in alphabetical order, with the exception being when the order of loading packages may create undesirable conflicts (in which case, make a comment about the proper order for loading packages). The use of `require` is discouraged, except in function definitions or cases where the logical returned by `require` is needed for assignment.

_Rationale:_ Keeping all of the calls to `library` in one location makes it easier for the developer to know what the condition of the environment is. Leaving calls to `library` in files that are sourced obscures the impact to the environment and may create unexpected and confusing results. Alphabetizing the packages makes it easier to evaluate which packages are present when adding or removing packages.

```
# Good examples -----------------------------------------------------
library(dplyr)
library(ggplot2)
library(stringr)
library(tidyr)

# Bad examples ------------------------------------------------------
library(stringr)
library(keyring)
library(rjags)
library(dplyr)
```

### Assignment

_Recommendation:_ Use `<-` for object assignment. The use of `=` should be reserved for assigning arguments in function calls.

_Rationale:_ Object assignment is an important operation in understanding code flow. Using the arrow operator distinguishes this operation from assigning arguments in functions. 

```
# Good examples -----------------------------------------------------
x <- 123

# Bad examples ------------------------------------------------------
x = 123
```

### Line Length

_Recommendation:_ Keep the length of code lines to less than 80 characters. 

_Rationale:_ Developers work on different size screens. Keeping code to less than 80 characters minimizes horizontal scrolling for developers using smaller screens. Additionally, code at 80 characters wide will fit on a printed sheet of paper if printed copies of code are ever required.

```
# Good example ------------------------------------------------------
DataSubset <- select(Data, 
                     var1, 
                     var2, 
                     var3)  %>%  
  filter(var1 == "red") %>% 
  group_by(var2) %>% 
  summarise(x = mean(var3))

# Bad example -------------------------------------------------------
DataSubset <- select(Data, var1, var2, var3) %>% filter(var1 == "red") %>% group_by(var2) %>% summarise(x = mean(var3))
```

### Spacing

_Recommendation:_ Use a single space before and after operators, and a single space after commas. 

_Exceptions:_ Spaces are unnecessary between unary operators, such as `x^2`.

_Rationale:_ Spacing in this manner increases readability. 

```
# Good examples -----------------------------------------------------
x + y
x - y
x * y

mtcars[mtcars$am == 0, ]

lm(mpg ~ wt + disp, 
   data = mtcars)

# Bad examples ------------------------------------------------------
x+y
x-y
x*y

mtcars[mtcars$am==0,]

lm(mpg~wt+disp,data=mtcars)
```

### Indentation

_Recommendation:_ Use two spaces for indentation. 

_Rationale:_ The number of spaces associated with a tab differs between systems and integrated development environments. This choice assures that spacing is consistent across all IDEs and systems.

_Hint:_ If using R Studio, Global Options may be set to convert tabs into two spaces (indeed, this is default behavior).

### Braces

_Recommendation:_ An opening curly brace should never go on its own line; a closing curly brace should always go on its own line. You may omit curly braces when a block consists of a single statement; however, you must consistently either use or not use curly braces for single statement blocks.

_Exception:_ In the global environment, no line may begin with `else`. For consistency, `else` may be placed on the same line as a closing brace.

_Rationale:_ This is ubiquitous in the R community

<font color = "purple">While this is ubiquitous in the R community, no other sensible programming language does this. I'm not opposed to switching to putting the braces on their own line. </font>

```
# Good example ------------------------------------------------------
if (is.null(is_desired)){
  mean(x, na.rm = TRUE)
}

# Use of if and else
if (is.null(is_desired)){
  mean(x, na.rm = TRUE)
} else {
  median(x, na.rm = TRUE)
}

# Bad example -------------------------------------------------------
if (is.null(is_desired))
{
  mean(x, na.rm = TRUE)
}
```

### Commenting

_Recommendation:_ Comments are made starting with a `#` and a single space. These should be made describing logic, algorithms, or though processes that would not be immediately obvious to an external, third party reviewer. Comments should also be utilized to introduce new logical processes within code. Citing relevant documents may be appropriate, but some explanation is still prudent as documents can be retired.

_Rationale:_ It is wise to assume that a piece of code will not be looked at routinely for several months or years. We should not assume that even we ourselves will remember what the thought process was behind the code development.

```
# Comments can be as simple as this


# A new logical process ---------------------------------------------
# When starting a new logical process in the script, commenting 
# may require longer comments, like this one. Using several dash 
# characters helps to visually distinguish the section of code. 
# In the R Studio IDE, it also permits for code folding, which can
# help developers focus on important parts of code.
```

### Pipes

_Recommendation:_ Use the `magrittr` pipe operator `%>%`. Start a new line after each instance of the pipe operator. Only apply pipes to one principal object in a chain. 

_Rationale:_ The native pipe operator is still relatively new. Using `%>%` permits for backward compatible code. 

<font color = "purple">
R has supported a native pipe for a couple of years now. I'm not opposed to adopting it as our standard. It could pose a risk to backward compatibility with older versions of R, but if we don't consider that a major risk in our work, then it's probably worthwhile to move onto the native pipe.
</font>

```
# Good example ------------------------------------------------------
StudyData %>% 
  select(variable1, 
         variable2, 
         variable3, 
         variable4) %>% 
  mutate(new_variable = variable1 * variable4) %>% 
  group_by(variable3, 
           variable2) %>% 
  summarise(mean = mean(new_variable))

# Bad examples ------------------------------------------------------

# continuing lines after a pipe
StudyData %>% select(variable1, variable2, variable3, variable4) %>% 
  mutate(new_variable = variable1 * variable4) %>% 
  group_by(variable3, variable2) %>% summarise(mean = mean(new_variable))

# Applying pipes to two data sets
StudyData %>% 
  left_join(SubjectData %>% select(subject_id, study_id, study_country), 
            by = c("study_number" = "study_id"))

```

## Other Popular Style Guides

* [Tidyverse style guide](https://style.tidyverse.org/)
* [Advanced R Style guide](http://adv-r.had.co.nz/Style.html)
* [Google's R Style guide](https://web.stanford.edu/class/cs109l/unrestricted/resources/google-style.html)

