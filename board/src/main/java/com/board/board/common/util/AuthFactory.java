package com.board.board.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AuthFactory {

	private static final Logger Log = LoggerFactory.getLogger(AuthFactory.class);

	private static Blowfish cipher = null;

	// 암호화 AuthFactory.encryptPassword("password", null)
    public static String encryptPassword( String password, String keyString ) {
        if ( password == null ) {
            return null;
        }
        Blowfish cipher = getCipher( keyString );
        if ( cipher == null ) {
            throw new UnsupportedOperationException();
        }
        return cipher.encryptString( password );
    }

    // 복호화 AuthFactory.decryptPassword("password", null)
    public static String decryptPassword( String encryptedPassword, String keyString ) {
        if ( encryptedPassword == null ) {
            return null;
        }
        Blowfish cipher = getCipher( keyString );
        if ( cipher == null ) {
            throw new UnsupportedOperationException();
        }
        return cipher.decryptString( encryptedPassword );
    }

    private static synchronized Blowfish getCipher( String keyString ) {
        if ( cipher != null ) {
            return cipher;
        }
        try {
            cipher = new Blowfish( keyString );
        }
        catch ( Exception e ) {
            Log.error( e.getMessage(), e );
        }
        return cipher;
    }
}
