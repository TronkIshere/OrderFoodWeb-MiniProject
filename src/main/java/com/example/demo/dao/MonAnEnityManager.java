package com.example.demo.dao;


import com.example.demo.model.MonAnEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class MonAnEnityManager {
    private final static SessionFactory  sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    public List<MonAnEntity> getAll(){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query<MonAnEntity> query = session.createQuery("From MonAnEntity", MonAnEntity.class);
        List<MonAnEntity> monAn = query.getResultList();
        transaction.commit();
        session.close();
        return monAn;
    }

    public boolean insert(MonAnEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean update(MonAnEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean delete(MonAnEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.remove(entity);
        transaction.commit();
        session.close();
        return true;
    }
}