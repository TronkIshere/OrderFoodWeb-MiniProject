package com.example.demo.dao;


import com.example.demo.model.GioHangEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class GioHangEnityManager {
    private final static SessionFactory  sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    public List<GioHangEntity> getAll(){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Query<GioHangEntity> query = session.createQuery("From GioHangEntity ", GioHangEntity.class);
        List<GioHangEntity> GioHang = query.getResultList();
        transaction.commit();
        session.close();
        return GioHang;
    }

    public boolean insert(GioHangEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean update(GioHangEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(entity);
        transaction.commit();
        session.close();
        return true;
    }

    public boolean delete(GioHangEntity entity){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.remove(entity);
        transaction.commit();
        session.close();
        return true;
    }
}