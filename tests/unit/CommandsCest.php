<?php

namespace Beanspeak\Test\Unit;

use UnitTester;
use Beanspeak\Client;
use Beanspeak\Exception;
use PHPUnit_Framework_SkippedTestError as SkipException;

/**
 * \Beanspeak\Test\Unit\CommandsCest
 * Tests the \Beanspeak\Client component
 *
 * @copyright (c) 2016 Phalcon Team
 * @link      http://www.phalconphp.com
 * @author    Serghei Iakovlev <serghei@phalconphp.com>
 * @package   Beanspeak\Test\Unit
 *
 * The contents of this file are subject to the New BSD License that is
 * bundled with this package in the file LICENSE.txt
 *
 * If you did not receive a copy of the license and are unable to obtain it
 * through the world-wide-web, please send an email to license@phalconphp.com
 * so that we can send you a copy immediately.
 */
class CommandsCest
{
    public function _before(UnitTester $I)
    {
        if (!defined('TEST_BT_HOST') || !defined('TEST_BT_PORT')) {
            throw new SkipException(
                'TEST_BT_HOST and/or TEST_BT_PORT env variables are not defined.'
            );
        }
    }

    public function putAndPeek(UnitTester $I)
    {
        $I->wantTo('put task to the desired tube and peek job from this tube by id');

        $client = new Client([
            'host' => TEST_BT_HOST,
            'port' => TEST_BT_PORT,
        ]);

        $client->useTube('testTube');

        $jobId = $client->put('testPutInTube');
        $I->assertNotEquals(false, $jobId);

        $job = $client->peekJob($jobId);
        $I->assertInstanceOf('Beanspeak\Job', $job);

        $I->assertEquals($jobId, $job->getId());
        $I->assertTrue($job->delete());
    }
}