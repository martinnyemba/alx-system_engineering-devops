
# 0x16. API Advanced

## Description

This project involves working with the Reddit API to retrieve and manipulate data from various subreddit endpoints. The goal is to practice making API calls, handling JSON data, implementing pagination, and utilizing recursion to solve complex problems that involve interacting with APIs.

## Learning Objectives

By the end of this project, you should be able to:

- Read API documentation to find the necessary endpoints.
- Use an API with pagination.
- Parse JSON results from an API.
- Make recursive API calls.
- Sort a dictionary by value.

## Requirements

- **Python version:** 3.4.3
- **Libraries:** Requests (for making HTTP requests)
- **OS:** Ubuntu 20.04 LTS
- All files should end with a new line.
- All Python files should start with `#!/usr/bin/python3`.
- Code should follow the PEP 8 style guide.
- All modules should include documentation.

## Setup

To set up your environment:

1. Install Python 3.4.3:
    ```bash
    sudo apt-get update
    sudo apt-get install python3.4
    ```

2. Install the Requests library:
    ```bash
    pip install requests
    ```
## Tests :heavy_check_mark:

* [tests](./tests): Folder of test files for all tasks. Provided by ALX.

## Function Prototypes :floppy_disk:

Prototypes for functions written in this project:

| File           | Prototype                               |
| -------------- | --------------------------------------- |
| `0-subs.py`    | `def number_of_subscribers(subreddit)`  |
| `1-top_ten.py` | `def top_ten(subreddit)`                |
| `2-recurse.py` | `def recurse(subreddit, hot_list=[])`   |
| `100-count.py` | `def count_words(subreddit, word_list)` |

## Tasks

### Task 0: How Many Subs?

**File:** `0-subs.py`  
**Prototype:** `def number_of_subscribers(subreddit):`
* [1-top_ten.py](./1-top_ten.py): Python function that prints the top ten
  hottest posts for a given subreddit.

- Queries the Reddit API to return the total number of subscribers for a given subreddit.
- Returns `0` if the subreddit is invalid.

### Task 1: Top Ten

**File:** `1-top_ten.py`  
**Prototype:** `def top_ten(subreddit):`

- Queries the Reddit API to print the titles of the first 10 hot posts listed for a given subreddit.
- Prints `None` if the subreddit is invalid.

### Task 2: Recurse It!

**File:** `2-recurse.py`  
**Prototype:** `def recurse(subreddit, hot_list=[])`
* [2-recurse.py](./2-recurse.py): Python function that recursively returns a
  list of titles for all hot articles on a given subreddit.

- Recursively queries the Reddit API to return a list containing the titles of all hot articles for a given subreddit.
- Returns `None` if the subreddit is invalid.

### Task 3: Count It!

**File:** `100-count.py`
* [100-count.py](./100-count.py): Python function that recursively prints a
  sorted count of given keywords parsed from titles of all hot articles on a given
  subreddit. 
**Prototype:** `def count_words(subreddit, word_list):`

- Recursively queries the Reddit API, parses the titles of all hot articles, and prints a sorted count of specified keywords.
- Results are sorted by count in descending order, and alphabetically in ascending order for ties.
- If no posts match or the subreddit is invalid, it prints nothing.

## Example Usage

```bash
$ python3 0-main.py programming
756024
$ python3 1-main.py programming
# (Prints the first 10 hot posts' titles)
$ python3 2-main.py programming
# (Prints the number of hot posts found)
$ python3 100-main.py programming 'react python java javascript'
# (Prints the sorted count of specified keywords)
```

## Author

[Martin Nyemba] - [GitHub Profile]
