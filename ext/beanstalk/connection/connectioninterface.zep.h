
extern zend_class_entry *beanstalk_connection_connectioninterface_ce;

ZEPHIR_INIT_CLASS(Beanstalk_Connection_ConnectionInterface);

ZEPHIR_INIT_FUNCS(beanstalk_connection_connectioninterface_method_entry) {
	PHP_ABSTRACT_ME(Beanstalk_Connection_ConnectionInterface, connect, NULL)
	PHP_FE_END
};
