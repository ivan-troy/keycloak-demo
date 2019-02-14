package com.it.kc;

import org.jboss.logging.Logger;

import org.keycloak.Config;
import org.keycloak.events.EventListenerProvider;
import org.keycloak.events.EventListenerProviderFactory;
import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.provider.ServerInfoAwareProviderFactory;

import java.util.LinkedHashMap;
import java.util.Map;


public class MyLoggingEventListenerProviderFactory implements EventListenerProviderFactory, ServerInfoAwareProviderFactory {

    public static final String ID = "my-logging";

    private static final Logger logger = Logger.getLogger("org.keycloak.events");

    private Logger.Level successLevel;
    private Logger.Level errorLevel;


    @Override
    public EventListenerProvider create(KeycloakSession session) {
        return new MyLoggingEventListenerProvider(session, logger, successLevel, errorLevel);
    }

    @Override
    public void init(Config.Scope config) {
        successLevel = Logger.Level.valueOf(config.get("success-level", "debug").toUpperCase());
        errorLevel = Logger.Level.valueOf(config.get("error-level", "warn").toUpperCase());
    }

    @Override
    public void postInit(KeycloakSessionFactory factory) {

    }

    @Override
    public void close() {
    }

    @Override
    public String getId() {
        return ID;
    }

    @Override
    public Map<String, String> getOperationalInfo() {
        Map<String, String> ret = new LinkedHashMap<String, String>();
        ret.put("Version", "1.0");
        ret.put("Author",  "Ivan Santaella");
        ret.put("Logger",  "org.keycloak.events");

        //ret.put("listSizeCurrent", events.size() + "");
        return ret;
    }

}