<?php

declare(strict_types=1);

namespace Tests;

use PHPUnit\Framework\TestCase;

class HealthcheckTest extends TestCase
{
    public function testHealth(): void {
        $this->fail();
    }
}