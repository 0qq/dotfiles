{ pkgs, ... }:

{
  nvim-lspfuzzy = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-lspfuzzy";
    version = "2020-12-14";
    src = pkgs.fetchFromGitHub {
      owner = "ojroques";
      repo = "nvim-lspfuzzy";
      rev = "6b5dc735709aa3c67268d1c310b35f65ee86c7ef";
      sha256 = "0jbx5mac95nnbm1jnzdhkgxidin17lwg9gyvsqn0qcdly4gl4iqk";
    };
  };

  indent-guides-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "indent-guides-nvim";
    version = "2021-02-20";
    src = pkgs.fetchFromGitHub {
      owner = "glepnir";
      repo = "indent-guides.nvim";
      rev = "4462f3d171de59ce4bbda1fefdda31d76057e096";
      sha256 = "01zzc445sl1sznliggszsdg1bi4i10s0qnjqp9hmxz3p6a1wd8c6";
    };
  };
}
