library(lintr)

lilly_linters <- 
  list(
    # Naming Objects
    object_name = object_name_linter(styles = c("snake_case",  # most objects
                                                "SNAKE_CASE",  # constants
                                                "UPPERCASE",   # constants
                                                "camelCase",   # functions
                                                "CamelCase")), # data.frames
    object_length = object_length_linter(length = 32L),
    
    
    # Code Style Appearance
    assignment = assignment_linter(), 
    braces = brace_linter(),
    commas = commas_linter(), 
    comments = commented_code_linter(), 
    function_left_paren = function_left_parentheses_linter(), 
    infix_spaces = infix_spaces_linter(), 
    library = library_call_linter(), 
    line_length = line_length_linter(),
    paren_body = paren_body_linter(),
    quotes = quotes_linter(), 
    semicolon = semicolon_linter(), 
    spaces_inside = spaces_inside_linter(),
    spaces_left_parentheses = spaces_left_parentheses_linter(), 
    T_and_F = T_and_F_symbol_linter(), 
    todo_comment = todo_comment_linter(), 
    trailing_blank_lines = trailing_blank_lines_linter(),
    whitespace = whitespace_linter(), 
    
    
    # Use of Pipes
    pipe_call = pipe_call_linter(), 
    pipe_consistency = pipe_consistency_linter(), 
    pipe_continuation = pipe_continuation_linter(),
    
    
    # Avoiding environment pollution
    undesirable_function = undesirable_function_linter(funs = c("attach", 
                                                                "browser", 
                                                                "debug",
                                                                "debugcall", 
                                                                "debugonce", 
                                                                "detach", 
                                                                "par", 
                                                                "setwd", 
                                                                "sink", 
                                                                "trace", 
                                                                "undebug", 
                                                                "untrace")),
    
    # Avoiding Common Inefficiencies
    boolean = boolean_arithmetic_linter(),
    class_equals = class_equals_linter(),
    duplicate_argument = duplicate_argument_linter(), 
    equals_na = equals_na_linter(), 
    is_numeric = is_numeric_linter(),
    length_levels = length_levels_linter(), 
    length_test = length_test_linter(), 
    lengths = lengths_linter(), 
    literal_coercion = literal_coercion_linter(),
    seq = seq_linter(),
    sort = sort_linter(),
    vector_logic = vector_logic_linter(),
    
    
    # Efficient Coding Practice
    any_duplicated = any_duplicated_linter(), 
    any_na = any_is_na_linter(), 
    empty_assignment = empty_assignment_linter(), 
    implicit_assignment = implicit_assignment_linter(), 
    outer_negation = outer_negation_linter(), 
    
    
    # String handling
    condition = condition_message_linter(), 
    paste = paste_linter(), 
    regex_subset = regex_subset_linter(), 
    sprintf = sprintf_linter(),
    string_boundary = string_boundary_linter(),
    
    
    # Functions and Flow Control
    for_loop_index = for_loop_index_linter(), 
    function_return = function_return_linter(), 
    if_not_else = if_not_else_linter(), 
    ifelse_censor = ifelse_censor_linter(), 
    nested_ifelse = nested_ifelse_linter(), 
    redundant_equals = redundant_equals_linter(), 
    redundant_ifelse = redundant_ifelse_linter(),
    repeat_lint = repeat_linter(), 
    unnecessary_nested_if = unnecessary_nested_if_linter(), 
    unreachable_code = unreachable_code_linter(), 
    
    # Miscellaneous Code Issues
    keyword_quote = keyword_quote_linter(), 
    missing_argument = missing_argument_linter(), 
    nonportable_path = nonportable_path_linter(), 
    system_file = system_file_linter(), 
    undesirable_operator = undesirable_operator_linter(), 
    unnecessary_concatenation = unnecessary_concatenation_linter(), 
    unnecessary_lambda = unnecessary_lambda_linter() 
  )
