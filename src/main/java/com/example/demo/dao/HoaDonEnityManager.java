package com.example.demo.dao;


import com.example.demo.model.HoaDonEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class HoaDonEnityManager {
    private final static SessionFactory  sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    public List<HoaDonEntity> getAll(){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query<HoaDonEntity> query = session.createQuery("From HoaDonEntity ", HoaDonEntity.class);
        List<HoaDonEntity> hoaDon = query.getResultList();
        transaction.commit();
        session.close();
        return hoaDon;
    }

    public boolean insert(HoaDonEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean update(HoaDonEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean delete(HoaDonEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.remove(entity);
        transaction.commit();
        session.close();
        return true;
    }
}