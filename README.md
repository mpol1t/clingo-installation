# Clingo Installation Guide for Linux

Clingo is an advanced Answer Set Programming (ASP) solver. This guide provides step-by-step instructions on how to install Clingo on a Linux system.

## Prerequisites

Ensure that your Linux system has the following installed:

- `build-essential`
- `cmake`
- `re2c`
- `bison`
- `git`

If any of these are missing, you can install them using the following command:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install build-essential cmake re2c bison git -y
```

## Clingo Installation Steps

1. **Clone the Clingo Repository:**

   ```bash
   git clone https://github.com/potassco/clingo.git
   ```

2. **Navigate to the Clingo Directory:**

   ```bash
   cd clingo
   ```

3. **Initialize and Update Submodules:**

   Clingo comes with submodules which need to be initialized and updated:

   ```bash
   git submodule init
   git submodule update
   ```

4. **Prepare the Build:**

   ```bash
   cmake .
   ```

5. **Build Clingo:**

   ```bash
   make
   ```
   
6. **Test the Installation:**

   You should now be able to run Clingo from within its directory using the `clingo` command. Try running:

   ```bash
   ./bin/clingo
   ```

   If the installation was successful, you should see a help message.

## Running a Sample Program with Clingo

After installing Clingo, you can check that it's working correctly by solving N-queens problem.

Here are the steps to create and run the program:

1. Open a text editor and create a new file named `queens.lp`.

2. Write the following in the file:

    ```asp
    % Define the size of the board
    #const n = 128.
    
    % Define the squares
    square(1..n, 1..n).
    
    % Place a queen on each row
    1 { queen(I, J) : square(I, J) } 1 :- I = 1..n.
    
    % No two queens on the same row or column
    :- queen(I, J), queen(K, J), I != K.
    :- queen(I, J), queen(I, K), J != K.
    
    % No two queens on the same diagonal
    :- queen(I, J), queen(K, L), I-J = K-L, I != K.
    :- queen(I, J), queen(K, L), I+J = K+L, I != K.
    
    % Show the queens
    #show queen/2.
    ```

3. Save and close the file.

4. Open a terminal and navigate to the directory where you saved `queens.lp`.

5. Run the program with Clingo using the following command:

    ```bash
    ./bin/clingo queens.lp
    ```
    
Congratulations, you have successfully run your first ASP program with Clingo!


## Troubleshooting

If you encounter errors during the installation, make sure all the prerequisites are installed and your system is up-to-date. If the errors persist, consider installing a pre-compiled binary of Clingo from the [Potassco website](https://potassco.org/clingo/).
