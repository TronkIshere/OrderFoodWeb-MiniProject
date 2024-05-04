package com.example.demo.dao;


import com.example.demo.model.NguoiDungEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class NguoiDungEntityManager {
    private final static SessionFactory  sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    public List<NguoiDungEntity> getAll(){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query<NguoiDungEntity> query = session.createQuery("From NguoiDungEntity", NguoiDungEntity.class);
        List<NguoiDungEntity> users = query.getResultList();
        transaction.commit();
        session.close();
        return users;
    }

    public boolean insert(NguoiDungEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean update(NguoiDungEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean delete(NguoiDungEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.remove(entity);
        transaction.commit();
        session.close();
        return true;
    }
}
