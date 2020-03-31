// This file has been generated with qpropgen, any changes made to it will be lost!

#ifndef BASESOUNDLISTMODEL_H
#define BASESOUNDLISTMODEL_H

#include <QObject>
#include <QAbstractListModel>

class BaseSoundListModel : public QAbstractListModel {
    Q_OBJECT

    Q_PROPERTY(int count READ count
            NOTIFY countChanged
    )

public:
    explicit BaseSoundListModel(QObject* parent = nullptr);


    virtual int count() const = 0;


signals:

    void countChanged(int count);

private:
    int mCount;
};

#endif // BASESOUNDLISTMODEL_H
