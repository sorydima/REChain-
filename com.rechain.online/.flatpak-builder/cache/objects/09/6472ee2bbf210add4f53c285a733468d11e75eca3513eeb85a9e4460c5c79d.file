
#ifndef OLM_EXPORT_H
#define OLM_EXPORT_H

#ifdef OLM_STATIC_DEFINE
#  define OLM_EXPORT
#  define OLM_NO_EXPORT
#else
#  ifndef OLM_EXPORT
#    ifdef olm_EXPORTS
        /* We are building this library */
#      define OLM_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define OLM_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef OLM_NO_EXPORT
#    define OLM_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef OLM_DEPRECATED
#  define OLM_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef OLM_DEPRECATED_EXPORT
#  define OLM_DEPRECATED_EXPORT OLM_EXPORT OLM_DEPRECATED
#endif

#ifndef OLM_DEPRECATED_NO_EXPORT
#  define OLM_DEPRECATED_NO_EXPORT OLM_NO_EXPORT OLM_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef OLM_NO_DEPRECATED
#    define OLM_NO_DEPRECATED
#  endif
#endif

#endif /* OLM_EXPORT_H */
