#include "contactmodel.h"
#include "dialfilter.h"
ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel(parent),mList(nullptr)
{
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid()|| !mList)
        return 0;

    return mList->contacts().size();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    qDebug("Model data row %d role %d",index.row(),role);
    const ContactItem item = mList->contacts().at(index.row());
    switch (role) {
        case ContactRole:
                return QVariant(item.cName);
        case PhoneRole:
            return QVariant(item.cPhone);

        }
    return QVariant();
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> names;
        names[ContactRole] = "cName";
        names[PhoneRole] = "cPhone";
        return names;
}

DialFilter *ContactModel::list() const
{
    return mList;
}

void ContactModel::setList(DialFilter *list)
{
    beginResetModel();
        if(mList)
            mList->disconnect(this);
        mList = list;
        if (mList){
            connect(mList, &DialFilter::preItemAppedned,this,[=](){
                const int index = mList->contacts().size();
                beginInsertRows(QModelIndex(),index,index);
            });
            connect(mList, &DialFilter::postItemAppended,this,[=](){
                endInsertRows();
            });
            connect(mList, &DialFilter::preItemRemoved,this,[=](int index){
                beginRemoveRows(QModelIndex(),index,index);
            });
            connect(mList, &DialFilter::postItemRemoved,this,[=](){
                endRemoveRows();
            });
        }
        endResetModel();
}
