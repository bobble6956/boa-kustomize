#!/bin/bash
complied_dir=./complied
dc_dir=./overlays/dc-on-prem/
dr_dir=./overlays/dr-cloud/
dc_complied_dir=./overlays/dc-on-prem/complied
dr_complied_dir=./overlays/dr-cloud/complied

#generate dc manifest
rm -rf $dc_complied_dir/* && kustomize build $dc_dir -o $dc_complied_dir

#generate dr manifest
rm -rf $dr_complied_dir/* && kustomize build $dr_dir -o $dr_complied_dir

#consolidate all manifests
rm -rf $complied_dir/* && cp -a $dc_complied_dir/* $complied_dir && cp -a $dr_complied_dir/* $complied_dir
