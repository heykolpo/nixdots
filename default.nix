{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./core
    ./home
  ]
}
