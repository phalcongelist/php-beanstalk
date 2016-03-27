
#ifdef HAVE_CONFIG_H
#include "../../ext_config.h"
#endif

#include <php.h>
#include "../../php_ext.h"
#include "../../ext.h"

#include <Zend/zend_exceptions.h>

#include "kernel/main.h"


/**
 * Beanspeak\Command\CommandInterface
 */
ZEPHIR_INIT_CLASS(Beanspeak_Command_CommandInterface) {

	ZEPHIR_REGISTER_INTERFACE(Beanspeak\\Command, CommandInterface, beanspeak, command_commandinterface, beanspeak_command_commandinterface_method_entry);

	return SUCCESS;

}

/**
 * The command line, without trailing CRLF.
 */
ZEPHIR_DOC_METHOD(Beanspeak_Command_CommandInterface, getCommandLine);

/**
 * Whether the command is followed by data.
 */
ZEPHIR_DOC_METHOD(Beanspeak_Command_CommandInterface, hasData);

/**
 *  The binary data to follow the command.
 */
ZEPHIR_DOC_METHOD(Beanspeak_Command_CommandInterface, getData);

/**
 * The length of the binary data in bytes.
 */
ZEPHIR_DOC_METHOD(Beanspeak_Command_CommandInterface, getDataLength);

/**
 * The response parser for the command.
 */
ZEPHIR_DOC_METHOD(Beanspeak_Command_CommandInterface, getResponseParser);
