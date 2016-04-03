
extern zend_class_entry *beanspeak_command_kickjob_ce;

ZEPHIR_INIT_CLASS(Beanspeak_Command_KickJob);

PHP_METHOD(Beanspeak_Command_KickJob, __construct);
PHP_METHOD(Beanspeak_Command_KickJob, getName);
PHP_METHOD(Beanspeak_Command_KickJob, getCommandLine);
PHP_METHOD(Beanspeak_Command_KickJob, parseResponse);

ZEND_BEGIN_ARG_INFO_EX(arginfo_beanspeak_command_kickjob___construct, 0, 0, 1)
	ZEND_ARG_INFO(0, job)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO_EX(arginfo_beanspeak_command_kickjob_parseresponse, 0, 0, 1)
	ZEND_ARG_INFO(0, line)
	ZEND_ARG_INFO(0, data)
ZEND_END_ARG_INFO()

ZEPHIR_INIT_FUNCS(beanspeak_command_kickjob_method_entry) {
	PHP_ME(Beanspeak_Command_KickJob, __construct, arginfo_beanspeak_command_kickjob___construct, ZEND_ACC_PUBLIC|ZEND_ACC_CTOR)
	PHP_ME(Beanspeak_Command_KickJob, getName, NULL, ZEND_ACC_PUBLIC)
	PHP_ME(Beanspeak_Command_KickJob, getCommandLine, NULL, ZEND_ACC_PUBLIC)
	PHP_ME(Beanspeak_Command_KickJob, parseResponse, arginfo_beanspeak_command_kickjob_parseresponse, ZEND_ACC_PUBLIC)
	PHP_FE_END
};
