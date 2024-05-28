#ifndef CALC_BACK_H
#define CALC_BACK_H

#include <QObject>

class Calc_back : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString result READ result WRITE setResult NOTIFY resultChanged FINAL)

public:

    //QInVOKABLE
    Q_INVOKABLE void setA(const QString& A);
    Q_INVOKABLE void setB(const QString& B);
    Q_INVOKABLE void setOperInput(bool oper_input);
    Q_INVOKABLE bool getOperInput() const;
    Q_INVOKABLE void reset();
    Q_INVOKABLE QString getError() const;
    Q_INVOKABLE void setOperator(const QString& oper);
    Q_INVOKABLE void calculate();

    explicit Calc_back(QObject *parent = nullptr);

    QString result() const;
    void setResult(const QString &newResult);

signals:

    void resultChanged();

private:

    QString m_A;

    QString m_B;

    bool m_oper_input;

    QString m_result;

    QString m_error;

    QString m_oper;

    //Private Functions

    float Calculate(float a, float b, QString& comand);
};

#endif // CALC_BACK_H
