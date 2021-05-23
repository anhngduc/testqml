#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H

#include <QAbstractListModel>
class DialFilter;

class ContactModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(DialFilter *list READ list WRITE setList)

public:
    explicit ContactModel(QObject *parent = nullptr);

    enum{
      ContactRole,
      PhoneRole
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    virtual QHash<int, QByteArray> roleNames() const override;
    DialFilter *list() const;
    void setList(DialFilter *list);
private:
    DialFilter *mList;
};

#endif // CONTACTMODEL_H
