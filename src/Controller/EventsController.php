<?php

namespace App\Controller;

use App\Entity\Events;
use App\Form\EventsType;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\String\Slugger\SluggerInterface;

class EventsController extends AbstractController
{
    #[Route('/', name: 'index-page')]
    public function index(ManagerRegistry $doctrine): Response
    {
        $event = $doctrine->getRepository(Events::class)->findAll();
        // dd($event);
        return $this->render('events/index.html.twig', [
            "event" => $event
        ]);
    }
    #[Route('/create', name: 'create-page')]
    public function createPage(Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    {
        $event = new Events();
        $form = $this->createForm(EventsType::class, $event);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
             $event = $form->getData();
        $picture = $form->get('picture')->getData();

        if ($picture) {
            $originalFilename = pathinfo($picture->getClientOriginalName(), PATHINFO_FILENAME);
            $safeFilename = $slugger->slug($originalFilename);
            $newFilename = $safeFilename.'-'.uniqid().'.'.$picture->guessExtension();
            try {
                $picture->move(
                    $this->getParameter('picture_directory'),
                    $newFilename
                );
            } catch (FileException $e) {
            }
            $event->setPicture($newFilename);
        }

        $em = $doctrine->getManager(); // <- for db
        $em->persist($event);
        $em->flush();

        return $this->redirectToRoute('index-page');

        }

        return $this->render('events/create.html.twig', [
            "form" => $form->createView()
        ]);
    }
    #[Route('/update/{id}', name: 'update-page')]
    public function updatePage($id, Request $request, ManagerRegistry $doctrine, SluggerInterface $slugger): Response
    {
        $event = $doctrine->getRepository(Events::class)->find($id);
        $form = $this->createForm(EventsType::class, $event);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
             $event = $form->getData();
        $picture = $form->get('picture')->getData();

            if ($picture) {
                $originalFilename = pathinfo($picture->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$picture->guessExtension();
                try {
                    $picture->move(
                        $this->getParameter('picture_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                }
                $event->setPicture($newFilename);
            }
        $em = $doctrine->getManager(); // <- for db
        $em->persist($event);
        $em->flush();

        return $this->redirectToRoute('index-page');

        }
        return $this->render('events/update.html.twig', [
            "form" => $form->createView()
        ]);
    }
    #[Route('/details/{id}', name: 'details-page')]
    public function detailsPage($id, ManagerRegistry $doctrine): Response
    {
        $event = $doctrine->getRepository(Events::class)->find($id);
        return $this->render('events/details.html.twig', [
            "event" => $event
        ]);
    }
    #[Route('/delete/{id}', name: 'delete-page')]
    public function deletePage($id, ManagerRegistry $doctrine): Response
    {
        $em = $doctrine->getManager();
        $event = $doctrine->getRepository(Events::class)->find($id);
        $em->remove($event);
        $em->flush();
        return $this->redirectToRoute("index-page");
               
    }
    #[Route('/about', name: 'about-page')]
    public function aboutPage(): Response
    {
        return $this->render('events/about.html.twig', [
           
        ]);
    }
}