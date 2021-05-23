#ifndef DIALFILTER_H
#define DIALFILTER_H

#include <QObject>
#include<QVector>

struct ContactItem
{
    QString cName;
    QString cPhone;
};

class DialFilter : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(ContactItem contact READ conV WRITE setConV NOTIFY conVChanged)
    Q_PROPERTY(QString cond READ cond WRITE setConditon NOTIFY condChanged)
    Q_PROPERTY(QString color1 READ color1 WRITE setColor1 NOTIFY color1Changed)
public:
    explicit DialFilter(QObject *parent = nullptr);
    QVector<ContactItem> contacts() const;
    QString cond();
    QString color1();
signals:
    void condChanged();

    void preItemAppedned();
    void postItemAppended();
    void preItemChanged(int index);
    void postItemChanged(int index);
    void preItemRemoved(int index);
    void postItemRemoved();
    void color1Changed();
public slots:    
    void setConditon(QString);
    void resetContactList();
    void filterContactList();
    void setColor1(QString);
private:
    QVector<ContactItem> mContacts;
    QString m_cond;
    QString m_color;
    bool checkPhone(int,QString);
    int checkName(ContactItem,QString);

};

#endif // DIALFILTER_H
