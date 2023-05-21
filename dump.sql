PGDMP                          {            shortly_s2ee    14.7 #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)     J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    16389    shortly_s2ee    DATABASE     `   CREATE DATABASE shortly_s2ee WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF8';
    DROP DATABASE shortly_s2ee;
                matheus    false            N           0    0    shortly_s2ee    DATABASE PROPERTIES     5   ALTER DATABASE shortly_s2ee SET "TimeZone" TO 'utc';
                     matheus    false            O           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO matheus;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   matheus    false    3            �            1259    16429    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    userid integer NOT NULL,
    token text NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.sessions;
       public         heap    matheus    false            �            1259    16428    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          matheus    false    212            P           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          matheus    false    211            �            1259    16395    users    TABLE     -  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    confirmpassword character varying(45) NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    matheus    false            �            1259    16394    user_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.user_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.user_userid_seq;
       public          matheus    false    210            Q           0    0    user_userid_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.user_userid_seq OWNED BY public.users.id;
          public          matheus    false    209            �           2604    16432    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          matheus    false    211    212    212            �           2604    16398    users id    DEFAULT     g   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_userid_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          matheus    false    210    209    210            G          0    16429    sessions 
   TABLE DATA           @   COPY public.sessions (id, userid, token, createdat) FROM stdin;
    public          matheus    false    212   �       E          0    16395    users 
   TABLE DATA           V   COPY public.users (id, name, email, password, confirmpassword, createdat) FROM stdin;
    public          matheus    false    210          R           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);
          public          matheus    false    211            S           0    0    user_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_userid_seq', 1, false);
          public          matheus    false    209            �           2606    16437    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            matheus    false    212            �           2606    16439    sessions sessions_token_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);
 E   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_token_key;
       public            matheus    false    212            �           2606    16403    users user_email_key 
   CONSTRAINT     P   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_email_key UNIQUE (email);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT user_email_key;
       public            matheus    false    210            �           2606    16401    users user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            matheus    false    210            �           2606    16440    sessions sessions_userid_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_userid_fkey;
       public          matheus    false    212    2995    210            �           826    16391     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     O   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO matheus;
                   postgres    false            �           826    16393    DEFAULT PRIVILEGES FOR TYPES    DEFAULT ACL     K   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO matheus;
                   postgres    false            �           826    16392     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     O   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO matheus;
                   postgres    false            �           826    16390    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     L   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO matheus;
                   postgres    false            G      x������ � �      E      x������ � �     