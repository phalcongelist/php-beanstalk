/*
 +------------------------------------------------------------------------+
 | Beanspeak                                                              |
 +------------------------------------------------------------------------+
 | Copyright (c) 2016 Phalcon Team (http://www.phalconphp.com)            |
 +------------------------------------------------------------------------+
 | This source file is subject to the New BSD License that is bundled     |
 | with this package in the file docs/LICENSE.txt.                        |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to license@phalconphp.com so we can send you a copy immediately.       |
 +------------------------------------------------------------------------+
 | Authors: Serghei Iakovlev <serghei@phalconphp.com>                     |
 +------------------------------------------------------------------------+
*/

namespace Beanspeak\Response\Parser;

use Beanspeak\Response\ArrayResponse;
use Beanspeak\Response\ResponseInterface;

/**
 * Beanspeak\Response\Parser\Yaml
 */
class Yaml implements ParserInterface
{
    private mode;

    /**
     * Beanspeak\Response\Parser\Yaml constructor.
     */
    public function __construct(string! mode)
    {
        if mode != "list" && mode != "dict" {
            throw new Exception("Parser mode must be either list or dict");
        }

        let this->mode = mode;
    }

    /**
     * Fetch a YAML payload from the Beanstalkd server
     * @throws \Beanspeak\Response\Parser\Exception
     */
    public function parseResponse(string line, string data = null) -> <ResponseInterface>
    {
        var response;

        if line == "NOT_FOUND" {
            throw new Exception("Server reported: NOT_FOUND");
        }

        if !starts_with(line, "OK ") {
            throw new Exception("Unhandled response: " . line);
        }

        let response = this->yamlParse(this->mode, data);

        return new ArrayResponse("OK", response);
    }

    internal function yamlParse(string! mode, string data = null) -> array
    {
        var lines, values, value, response = [];

        if typeof data != "string" || empty(data) {
            return [];
        }

        if function_exists("yaml_parse") {
            let response = yaml_parse(data);

            if mode == "list" {
                var key, value, tmp = [];

                for key, value in response {
                    let tmp[] = key . ": " . value;
                }

                let response = tmp;
            }

            return response;
        }

        let data  = rtrim(data),
            lines = preg_split("#[\r\n]+#", rtrim(data));

        if isset(lines[0]) && lines[0] == "---" {
            array_shift(lines);
        }

        if typeof lines != "array" || empty(lines) {
            trigger_error("YAML parse error. Raw data: " . print_r(lines, true), E_USER_WARNING);
            return [];
        }

        if mode == "list" {
            return lines;
        }

        for values in lines {
            let value = explode(":", values);

            if isset(value[1]) {
                trigger_error("YAML parse error for line: " . values, E_USER_WARNING);
            } else {
                let response[ltrim(value[0], '- ')] = trim(value[1]);
            }
        }

        return response;
    }
}
