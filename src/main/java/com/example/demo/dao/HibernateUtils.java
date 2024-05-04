package com.example.demo.dao;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            // Tạo phiên làm việc từ tệp cấu hình hibernate.cfg.xml
            return new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Xảy ra ngoại lệ trong quá trình khởi tạo phiên làm việc, in ra thông báo và kết thúc ứng dụng
            System.err.println("Khởi tạo SessionFactory thất bại: " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        // Đóng phiên làm việc và giải phóng tất cả các nguồn lực
        getSessionFactory().close();
    }
}
