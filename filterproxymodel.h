#ifndef FILTERPROXYMODEL_H
#define FILTERPROXYMODEL_H

#include <QObject>
#include <QSortFilterProxyModel>

class FilterProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    explicit FilterProxyModel(QObject *parent = nullptr);

    Q_INVOKABLE void setFilterString(QString string);

    Q_INVOKABLE void setSortOrder(bool checked);

signals:

public slots:
};

#endif // FILTERPROXYMODEL_H
