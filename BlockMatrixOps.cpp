// Copyright (C) 2016 zirkleac@miamiOH.edu

#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
#include "MatrixOps.h"
#include <omp.h>

Matrix blockMultiply(const Matrix& matrix1, const Matrix& matrix2, const size_t blockSize) {

    const size_t cols = matrix2[0].size();
    Matrix matrix3(matrix1.size(), std::vector<Val>(cols));
    for (unsigned int blockRow = 0; blockRow < matrix1.size(); blockRow += blockSize) {
        for (unsigned int blockColumn = 0; blockColumn < matrix2[0].size(); blockColumn += blockSize) {
            for (unsigned int blockK = 0; blockK < matrix1[0].size(); blockK += blockSize) {
                for (unsigned int row = blockRow; row < std::min(blockRow + blockSize, matrix1.size()); ++row) {
                    for (unsigned int column = blockColumn; column < std::min(blockColumn + blockSize, matrix2[0].size()); ++column) {
                        for (unsigned int k = blockK; k < std::min(blockK + blockSize, matrix1[0].size()); ++k) {
                            matrix3[row][column] += matrix1[row][k] * matrix2[k][column];
                        }
                    }
                }
            }
        }
    }
    return matrix3;
}
Matrix load(const std::string& filePath) {
    std::string line;
    std::ifstream myfile(filePath);
    if (myfile.is_open()) {
        unsigned int rows, cols;
        myfile >> rows >> cols;
        Matrix mat = initMatrix(rows, cols);
        for (size_t row = 0; (row < rows); row++) {
            for (size_t col = 0; (col < cols); col++) {
                myfile >> mat[row][col];
            }
        }
        myfile.close();

        return mat;
    } else std::cout << "Unable to open file";

    return Matrix();
}

void write(const std::string& filePath, const Matrix& mat) {
    std::ofstream myfile(filePath);
    if (myfile.is_open()) {
        unsigned int rows = mat.size();
        unsigned int cols = mat[0].size();
        myfile << rows << " " << cols << std::endl;
        for (size_t row = 0; (row < rows); row++) {
            for (size_t col = 0; (col < cols); col++) {
                myfile << "" << mat[row][col] << " ";
            }
            myfile << std::endl;
        }
        myfile.close();
    } else std::cout << "Unable to open file";

}
