PGDMP     &                    {            shortly_o9zs    14.7 #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) $    X           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            [           1262    16389    shortly_o9zs    DATABASE     `   CREATE DATABASE shortly_o9zs WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF8';
    DROP DATABASE shortly_o9zs;
                matheus    false            \           0    0    shortly_o9zs    DATABASE PROPERTIES     5   ALTER DATABASE shortly_o9zs SET "TimeZone" TO 'utc';
                     matheus    false            ]           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO matheus;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   matheus    false    3            �            1259    16482    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    matheus    false            �            1259    16481    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          matheus    false    212            ^           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          matheus    false    211            �            1259    16517    urls    TABLE     �   CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    shorturl text,
    views integer DEFAULT 0,
    userid integer NOT NULL
);
    DROP TABLE public.urls;
       public         heap    matheus    false            �            1259    16516    urls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.urls_id_seq;
       public          matheus    false    214            _           0    0    urls_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;
          public          matheus    false    213            �            1259    16441    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    matheus    false            �            1259    16440    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          matheus    false    210            `           0    0    user_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;
          public          matheus    false    209            �           2604    16485    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          matheus    false    212    211    212            �           2604    16520    urls id    DEFAULT     b   ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);
 6   ALTER TABLE public.urls ALTER COLUMN id DROP DEFAULT;
       public          matheus    false    214    213    214            �           2604    16444    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          matheus    false    209    210    210            S          0    16482    sessions 
   TABLE DATA           B   COPY public.sessions (id, "userId", token, createdat) FROM stdin;
    public          matheus    false    212   �$       U          0    16517    urls 
   TABLE DATA           @   COPY public.urls (id, url, shorturl, views, userid) FROM stdin;
    public          matheus    false    214   j%       Q          0    16441    users 
   TABLE DATA           E   COPY public.users (id, name, email, password, createdat) FROM stdin;
    public          matheus    false    210   �%       a           0    0    sessions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);
          public          matheus    false    211            b           0    0    urls_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.urls_id_seq', 2, true);
          public          matheus    false    213            c           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 1, true);
          public          matheus    false    209            �           2606    16490    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            matheus    false    212            �           2606    16492    sessions sessions_token_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);
 E   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_token_key;
       public            matheus    false    212            �           2606    16525    urls urls_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_pkey;
       public            matheus    false    214            �           2606    16527    urls urls_shorturl_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_shorturl_key UNIQUE (shorturl);
 @   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_shorturl_key;
       public            matheus    false    214            �           2606    16451    users user_name_key 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_name_key UNIQUE (name);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT user_name_key;
       public            matheus    false    210            �           2606    16449    users user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            matheus    false    210            �           2606    16493    sessions sessions_userId_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "sessions_userId_fkey";
       public          matheus    false    3002    210    212            �           2606    16528    urls urls_userid_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);
 ?   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_userid_fkey;
       public          matheus    false    3002    210    214            �           826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     O   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO matheus;
                   postgres    false            �           826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     K   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO matheus;
                   postgres    false            �           826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     O   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO matheus;
                   postgres    false            �           826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     L   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO matheus;
                   postgres    false            S   i   x�]̹�  �Uq�A Q���L|��R�tv8�(�'ꌍ���חVK\X�Td���j63��$qX��*F��k�Q�%ol��wTjY�:x2 |�!�      U   1   x�3��())(���///�K��O�I�K���,	�q�-�4�4����� ��      Q      x�3��M,�H--��9)���鹉�9z����*FI*�*%&���9�9�yaaQFe.�������nN����^�������&n�I�A�a.�FFƺ��F�
�V&&V�z���f\1z\\\ 
$�     