package utilities;

import java.lang.reflect.Proxy;
import javax.sound.sampled.Clip;

public class SoundManager {
    static int nBullet;
    static int nSBullet;
    static boolean thrusting;
    static final String path = "/sounds/";

    private static final Clip SILENT_CLIP = (Clip) Proxy.newProxyInstance(
        SoundManager.class.getClassLoader(),
        new Class<?>[] { Clip.class },
        (proxy, method, args) -> {
            Class<?> returnType = method.getReturnType();
            if (returnType == boolean.class) return false;
            if (returnType == int.class) return 0;
            if (returnType == long.class) return 0L;
            if (returnType == float.class) return 0f;
            if (returnType == double.class) return 0d;
            if (returnType == byte.class) return (byte) 0;
            if (returnType == short.class) return (short) 0;
            if (returnType == char.class) return (char) 0;
            return null;
        }
    );

    public static final Clip huntedMode = SILENT_CLIP;
    public static final Clip map1M = SILENT_CLIP;
    public static final Clip map2M = SILENT_CLIP;
    public static final Clip map3M = SILENT_CLIP;
    public static final Clip map4M = SILENT_CLIP;
    public static final Clip map5M = SILENT_CLIP;
    public static final Clip collectS = SILENT_CLIP;
    public static final Clip dropS = SILENT_CLIP;
    public static final Clip[] clips = {
        huntedMode, map1M, map2M, map3M, map4M, map5M, collectS, dropS
    };

    public static void play(Clip clip) {}

    public static void loop(Clip clip) {}
}
