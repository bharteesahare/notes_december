PGDMP     &                 	    {            DbSpace    13.10 "   13.12 (Ubuntu 13.12-1.pgdg20.04+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16402    DbSpace    DATABASE     ^   CREATE DATABASE "DbSpace" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE "DbSpace";
                HSMaster    false            �            1259    16943    delivery_partners    TABLE     T  CREATE TABLE public.delivery_partners (
    id bigint NOT NULL,
    partner_name character varying,
    status integer DEFAULT 1,
    is_express character varying,
    is_surface character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    icon character varying
);
 %   DROP TABLE public.delivery_partners;
       public         heap    HSMaster    false            �            1259    16950    delivery_partners_id_seq    SEQUENCE     �   CREATE SEQUENCE public.delivery_partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.delivery_partners_id_seq;
       public          HSMaster    false    216            �           0    0    delivery_partners_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.delivery_partners_id_seq OWNED BY public.delivery_partners.id;
          public          HSMaster    false    217            [           2604    17102    delivery_partners id    DEFAULT     |   ALTER TABLE ONLY public.delivery_partners ALTER COLUMN id SET DEFAULT nextval('public.delivery_partners_id_seq'::regclass);
 C   ALTER TABLE public.delivery_partners ALTER COLUMN id DROP DEFAULT;
       public          HSMaster    false    217    216            �          0    16943    delivery_partners 
   TABLE DATA                 public          HSMaster    false    216   �       �           0    0    delivery_partners_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.delivery_partners_id_seq', 8, true);
          public          HSMaster    false    217            ]           2606    17140 (   delivery_partners delivery_partners_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.delivery_partners
    ADD CONSTRAINT delivery_partners_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.delivery_partners DROP CONSTRAINT delivery_partners_pkey;
       public            HSMaster    false    216            �   �  x�͔]o� ���+�K+�6`0ػZ�n��%ۚNە����+��t�~�c]VUj���c��z����o0�-����}��j��C�m[�8����V4j�v0cP�Tm{��!6�.D��V�*�
;C/�*��������-8�c0����n4��?��0��C�C �P�@�C����!�QBi������limo� �v��y��wMP���U�Z���Uc]}�	iN2��̸���4u�����K�ҵ��W�/5��pU�[��n����]�.�|&�ه��d��`6_|��>�;��W��!���}�������_�����Q����-8��gƷ��Y����QU��j�R� E!!!��N(���դ���>O	�[��i�̽�K���G~r����G~�ÎL��?� zʏ%%���K����;d��g-���Yh'Y�U6�(k���LeU��Z4}P�T�Z�U^;�8ݔʩZ{1a*�#!rFd.%B���X�F!�0�0��(`�ȍ8'�L��fo�|g$���;��%�6<m�䊨�+�Y�L3p�����?ͰZH�iQ��w�齧汻%@(��]�J��[vo���t�T]��;���6�?���C�N�%4��ED�� rH)G��P2|��i]����~��     