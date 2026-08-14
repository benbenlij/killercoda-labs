Question 1
-
- Goal: Find hidden file in investigator's home directory

- Sample Solution:
    ```
    ls -la /home/investigator/
    ```

- Answer: .$eCr3t.txt

- Explanation: Hidden files begin with `.` and using `ls` without options won't list the hidden file. You use must the `-a` option to list hidden files.

*Note: if you wrote the full path, it is technically correct but make sure you understand the difference between the filename and its path.

Question 2
-
- Goal: Find the file in the special directory starting with `-` in /opt using `cd`

- Sample Solution:
    ```
    cd /opt/-super-safe
    ls -la
    ```

- Answer: hacker_file.txt

- Explanation: Using `cd /opt` then `cd -super-safe` would print an error because the shell mistakes the beginning of the directory for an option/flag. Adding the full path or using shortcuts like `cd ./-super-safe` will allow you to change into the directory.

*Note: if you wrote the full path, it is technically correct but make sure you understand the difference between the filename and its path.

Question 3
-
- Goal: Find the secret diary in suspicious user's home directory

- Sample Solution:
    ```
    sudo ls -la /home/h@ck3r/
    ```

- Answer: f@k3d!arY.txt

- Explanation: Your user does not have permissions to read or write files in other users' home directories. To elevate your permissions, you must use sudo to list the suspicious user's home directory.

*Note: if you wrote the full path, it is technically correct but make sure you understand the difference between the filename and its path.

Question 4
-
- Goal: Find the description of an option for the command `ls` using `man`

- Sample Solution:
    ```
    man ls
    ```

- Answer: list entries by columns

- Explanation: By using the `man` command, you can understand what other commands do and their provided options. It is a good, quick resource to look at (you should NOT memorize every command and their options). 