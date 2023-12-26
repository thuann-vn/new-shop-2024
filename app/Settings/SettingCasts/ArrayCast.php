<?php
  namespace App\Settings\SettingCasts;
  class ArrayCast implements \Spatie\LaravelSettings\SettingsCasts\SettingsCast
  {
    /**
     * Will be used to when retrieving a value from the repository, and
     * inserting it into the settings class.
     */
    public function get($payload): array
    {
      if(!is_array($payload)){
        return [];
      }
      return array_map(function($item){
        return (array)$item;
      }, $payload);
    }

    /**
     * Will be used to when retrieving a value from the settings class, and
     * inserting it into the repository.
     */
    public function set($payload){
      return $payload;
    }
  }

