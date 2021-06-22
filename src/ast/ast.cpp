#include "ast.hpp"


namespace ast {
    Expression::~Expression() {}

    DoubleExpression::DoubleExpression(double value): value(value) {}
}