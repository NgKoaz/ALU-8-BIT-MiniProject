#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <algorithm>

// Function to split a line by delimiter
std::vector<std::string> split(const std::string &line, char delimiter)
{
    std::vector<std::string> tokens;
    std::stringstream ss(line);
    std::string token;
    while (std::getline(ss, token, delimiter))
    {
        tokens.push_back(token);
    }
    return tokens;
}

// Function to compare two CSV files
bool compareCSVFiles(const std::string &file1, const std::string &file2)
{
    std::ifstream inFile1(file1);
    std::ifstream inFile2(file2);

    // Check if files opened successfully
    if (!inFile1.is_open() || !inFile2.is_open())
    {
        std::cerr << "Error opening files!" << std::endl;
        return false;
    }

    // Check if file sizes are the same
    inFile1.seekg(0, std::ios::end);
    size_t fileSize1 = inFile1.tellg();
    inFile1.seekg(0, std::ios::beg);

    inFile2.seekg(0, std::ios::end);
    size_t fileSize2 = inFile2.tellg();
    inFile2.seekg(0, std::ios::beg);

    if (fileSize1 != fileSize2)
    {
        std::cerr << "Files have different sizes!" << std::endl;
        return false;
    }

    std::string line1, line2;
    while (std::getline(inFile1, line1) && std::getline(inFile2, line2))
    {
        // Split lines into tokens
        std::vector<std::string> tokens1 = split(line1, ',');
        std::vector<std::string> tokens2 = split(line2, ',');

        // Check if number of columns is the same
        if (tokens1.size() != tokens2.size())
        {
            std::cerr << "Rows have different number of columns!" << std::endl;
            return false;
        }

        // Compare each column value
        for (size_t i = 0; i < tokens1.size(); ++i)
        {
            if (tokens1[i] != tokens2[i])
            {
                std::cerr << "Mismatch in row data at column " << i + 1 << std::endl;
                return false;
            }
        }
    }

    // If we reach here, files are identical
    return true;
}

int main()
{
    std::string fileName1, fileName2;

    // Get file names from user
    std::cout << "Enter first file name: ";
    std::cin >> fileName1;

    std::cout << "Enter second file name: ";
    std::cin >> fileName2;

    if (compareCSVFiles(fileName1, fileName2))
    {
        std::cout << "Files are identical!" << std::endl;
    }
    else
    {
        std::cout << "Files are different!" << std::endl;
    }

    return 0;
}