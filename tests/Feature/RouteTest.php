<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RouteTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_home(){
      $response = $this->get('/');
      $response->assertResponseStatus(200);
    }

    public function test_details_vue_with_param(){
      $this->call('GET', '/details/1');
      $this->assertResponseStatus(200);
    }

    public function test_details_pvue_without_param(){
      $this->call('GET', '/details');
      $this->assertResponseStatus(404);
    }

    public function test_admin_without_param() {
      $this->call('GET', '/admin/pizza');
      $this->assertResponseStatus(200);
    }

    public function test_admin_with_param() {
      $this->call('GET', 'admin/pizza/1');
      $this->assertResponseStatus(200);
    }
}
