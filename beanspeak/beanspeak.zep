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

namespace Beanspeak;

use Beanspeak\Dispatcher\DispatcherInterface;
use Beanspeak\Dispatcher\DispatcherAwareInterface;

/**
 * Beanspeak\Beanspeak
 *
 * Class to access the beanstalk queue service.
 */
class Beanspeak implements DispatcherAwareInterface
{
    /**
     * The internal Dispatcher.
     * @var DispatcherInterface
     */
    protected dispatcher;

    /**
     * Beanspeak\Beanspeak constructor
     */
    public function __construct(<DispatcherInterface> dispatcher = null)
    {
        let dispatcher = dispatcher ?: new Dispatcher;

        let this->dispatcher = dispatcher;
    }

    /**
     * {@inheritdoc}
     */
    public function setDispatcher(<DispatcherInterface> dispatcher) -> <Beanspeak>
    {
         let this->dispatcher = dispatcher;

         return this;
    }

    /**
     * {@inheritdoc}
     */
    public function getDispatcher() -> <DispatcherInterface>
    {
        return this->dispatcher;
    }
}
