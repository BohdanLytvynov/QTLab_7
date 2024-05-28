#include "calc_back.h"

Calc_back::Calc_back(QObject *parent)
    : QObject(parent), m_oper_input(false)
{

}

QString Calc_back::result() const
{
    return m_result;
}

void Calc_back::setResult(const QString &newResult)
{
    if (m_result == newResult)
        return;
    m_result = newResult;
    emit resultChanged();
}

float Calc_back::Calculate(float a, float b, QString &comand)
{
    if(comand == "-")
    {
        return a - b;
    }
    else if(comand == "+")
    {
        return a + b;
    }
    else if(comand == "*")
    {
        return a * b;
    }
    else if(comand == "/")
    {
        return a/b;
    }

    return 1;
}

///QINVOKABLE definitions

void Calc_back::setOperator(const QString& oper)
{
    m_oper = oper;
}

void Calc_back::calculate()
{
    try
    {
        float res = Calculate(m_A.toFloat(), m_B.toFloat(), m_oper);

        setResult(QString::number(res));

        m_error = "";
    }
    catch(...)
    {
        m_error = "Incorrect input!";

        setResult("Undefined!");
    }
}

void Calc_back::setA(const QString& A)
{
    m_A += A;
}

void Calc_back::setB(const QString& B)
{
    m_B += B;
}

void Calc_back::setOperInput(bool oper_input)
{
    m_oper_input = oper_input;
}

bool Calc_back::getOperInput() const
{
    return m_oper_input;
}

void Calc_back::reset()
{
    m_oper_input = false;
    m_A = "";
    m_B = "";
    m_oper = "";
}

QString Calc_back::getError() const
{
    return m_error;
}
