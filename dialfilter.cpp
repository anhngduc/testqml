#include "dialfilter.h"
#include <iostream>
#include <fstream>
#include<QString>
#include<QDebug>
#include <QFile>
#include <QJsonDocument>
#include<QJsonObject>
#include<QJsonArray>

using namespace std;

DialFilter::DialFilter(QObject *parent) : QObject(parent)
{
    qDebug() <<"Createeddd";
    resetContactList();
}

QVector<ContactItem> DialFilter::contacts()const
{
    return mContacts;

}

QString DialFilter::cond()
{
    return m_cond;
}

QString DialFilter::color1()
{
    return m_color;
}



void DialFilter::setConditon(QString newCondition)
{
    if (m_cond != newCondition){
        m_cond = newCondition;
        emit condChanged();
        qDebug()<< newCondition;

        if (newCondition.length() ==0){
            resetContactList();
        } else {
            filterContactList();
        }

    }
}

void DialFilter::resetContactList()
{

    unsigned long x,maxItem;
    QFile file;
    QString val;
    file.setFileName("/home/anh/git_environment/testqml/contacts.json");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    val = file.readAll();
    file.close();
    QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());


    ifstream i("/home/anh/test2/contacts.json");

    maxItem = mContacts.size();
    //Clear all items
     qDebug("new size: %d item",mContacts.size());
    for (int i = maxItem-1 ; i>=0; i--){
        qDebug("item %d",i);

        emit preItemRemoved(i);
        mContacts.removeAt(i);
        emit postItemRemoved();
        qDebug("remove");

    }

    qDebug("new size: %d item",mContacts.size());
    //Append contacts from json
    foreach(QJsonValue element, d.array()){
        QJsonObject node = element.toObject();
        qDebug()<<node["name"] <<node["phone"];
        emit preItemAppedned();

        ContactItem item ;
        //item.cName =QStringLiteral("Ng duc anh");
        //item.cPhone = QStringLiteral("010--1111-111");
        item.cName =  node["name"].toString() ;
        item.cPhone = node["phone"].toString() ;
        mContacts.append(item);
        emit postItemAppended();
    }

    qDebug("new size: %d item",mContacts.size());
    setColor1("white");
}

void DialFilter::filterContactList()
{
    //qDebug("Filter contact list, condition: %s",qUtf8Printable(m_cond));

    for (int i = 0 ; i<mContacts.size();){
        qDebug("item %d",i);


        if(checkPhone(i,m_cond))
        {
            emit preItemRemoved(i);
            mContacts.removeAt(i);
            emit postItemRemoved();
            qDebug("remove");
        } else
        {
            //Change font color
            ++i;

        }

    }
    setColor1("lightblue");
}

void DialFilter::setColor1(QString newColor)
{
    m_color = newColor;
}
bool DialFilter::checkPhone(int index, QString cond)
{
    qDebug()<<"CHeckPhone: "<< cond;
    int fp;
    QString phone;

    phone = mContacts.at(index).cPhone;

    // Remove special characters

    phone = phone.replace("(","").replace(")","").replace("-","").replace(" ","").replace("#","").replace("*","");
    fp = phone.indexOf(cond);
    if(fp == -1)
    {
        qDebug()<<"CHeckPhone: "<< cond<<": Not found";
        //Not Found
        if(checkName(mContacts.at(index),m_cond) == 0){
        return true;}
    }
    else{

    }
    return false;
}
const QString cmap[10][5] ={{"0","","","",""},{"1","","","",""},{"2","a","b","c",""},{"3","d","e","f",""},{"4","g","h","i",""},{"5","j","k","l",""},{"6","m","n","o",""},{"7","p","q","r","s"},{"8","t","u","v",""},{"9","w","x","y","z"}};

int DialFilter::checkName(ContactItem item, QString cond)
{
    qDebug()<<"CHeckName: "<< cond;
    QString name;
    name = item.cName;

    // Remove special characters
    name = name.toLower().replace(" ","").replace("#","").replace("*","");
    cond= cond.toLower().replace(" ","").replace("#","").replace("*","");
    if (cond.length() == 0){ return true;}
    int j;
    int x,y;
    x=0; y=0;
    QString findString;
    QVector<QString> possibilities;

    for (y=0; y<5;y++){
         //qDebug()<<"Find1: "<<y;
        if (cmap[cond[0].digitValue()][y] == ""){ continue;}
        findString = cmap[cond[0].digitValue()][y];
        //qDebug()<<"Find1: "<< findString <<" in "<<name;
        if (name.indexOf(findString) != -1){
            possibilities.append(findString);
            qDebug()<<"!!!!!!!!!!!!!!!!!Found "<< findString<<"in "<<name;
        }

    }
    if ( possibilities.size() == 0){
        // not found
        return 0;
    }
    x=1;
    while (x < cond.length() && possibilities.size() > 0) {
        foreach(QString s, possibilities){
            for (y=0; y<5;y++){
                if (cmap[cond[x].digitValue()][y] == ""){ continue;}
                findString = s + cmap[cond[x].digitValue()][y];
                //qDebug()<<"Find: "<< findString <<" in "<<name;
                if (name.indexOf(findString) != -1){
                    possibilities.append(findString);
                    qDebug()<<"!!!!!!!!!!!!!!!!!Found "<< findString<<"in "<<name;
                }

            }
            possibilities.removeOne(s);
            if(possibilities.size() == 0 ){
                // Check all possibilites. not found
                return 0;
            }
            qDebug()<< "Size:" <<possibilities.size();
        }
        x++;
        //qDebug() << "Found String" << findString << "At"<< j;

    }

    return possibilities.size();
}
