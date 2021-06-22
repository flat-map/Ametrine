#pragma once
#include <string>
using std::string;

namespace ast {

    enum Type {
        Bool = 1,
        Double,
    };

    class Expression {
    public:
        virtual ~Expression();
        virtual Type getType() const = 0;
        virtual double getValue() const = 0;
    };

    class DoubleExpression : public Expression {
    public:
        DoubleExpression(double value);
        Type getType() const;
        double getValue() const;
    private:
        double value;
    };
}
